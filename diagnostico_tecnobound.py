"""
Diagnostico de projeto GameMaker (.yyp)
Uso: copie este arquivo para a pasta do projeto (onde fica o TecnoBound.yyp) e rode:
    python diagnostico_tecnobound.py
"""
import json, os, re, sys


class Tee:
    def __init__(self, *fs): self.fs = fs
    def write(self, t):
        for f in self.fs: f.write(t)
    def flush(self):
        for f in self.fs: f.flush()

_arq = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "resultado_diagnostico.txt"), "w", encoding="utf-8")
sys.stdout = Tee(sys.__stdout__, _arq)

try:
    ROOT = os.path.dirname(os.path.abspath(__file__))
    YYP = next((f for f in os.listdir(ROOT) if f.endswith(".yyp")), None)
    if not YYP:
        print("Nao achei nenhum .yyp nesta pasta.")
        input("\nAperte Enter para fechar...")
        sys.exit()

    problemas = []


    def ler_yy(caminho):
        with open(caminho, encoding="utf-8-sig") as f:
            txt = f.read()
        txt = re.sub(r",(\s*[}\]])", r"\1", txt)  # aceita virgulas finais do GameMaker
        return json.loads(txt)


    def achar_refs(obj, achados):
        """Percorre o JSON e coleta todo {"name":..,"path":"xxx/yyy.yy"}."""
        if isinstance(obj, dict):
            p = obj.get("path")
            if isinstance(p, str) and p.endswith(".yy") and "name" in obj:
                achados.append(p)
            for v in obj.values():
                achar_refs(v, achados)
        elif isinstance(obj, list):
            for v in obj:
                achar_refs(v, achados)


    proj = ler_yy(os.path.join(ROOT, YYP))
    pastas = {f["folderPath"] for f in proj["Folders"]}
    recursos = {r["id"]["path"] for r in proj["resources"]}
    print(f"Projeto: {YYP} | {len(recursos)} recursos | {len(pastas)} pastas\n")

    for caminho in sorted(recursos):
        completo = os.path.join(ROOT, caminho)
        if not os.path.isfile(completo):
            problemas.append(f"[ARQUIVO FALTANDO] {caminho}")
            continue
        try:
            yy = ler_yy(completo)
        except Exception as e:
            problemas.append(f"[YY CORROMPIDO] {caminho}: {e}")
            continue

        nome_esperado = os.path.splitext(os.path.basename(caminho))[0]
        if yy.get("name") != nome_esperado:
            problemas.append(f"[NOME DIFERENTE] {caminho}: dentro do arquivo e '{yy.get('name')}'")

        # pasta-pai
        parent = yy.get("parent")
        if not isinstance(parent, dict) or not parent.get("path"):
            problemas.append(f"[SEM PARENT] {caminho}")
        elif parent["path"] not in pastas:
            problemas.append(f"[PARENT INEXISTENTE] {caminho} -> {parent['path']}")

        # referencias a outros assets
        refs = []
        sem_parent = {k: v for k, v in yy.items() if k != "parent"}
        achar_refs(sem_parent, refs)
        for r in set(refs):
            if r != caminho and r not in recursos:
                problemas.append(f"[REFERENCIA QUEBRADA] {caminho} usa {r}, que nao esta no .yyp")

        # PNGs dos sprites
        if caminho.startswith("sprites/"):
            pasta = os.path.dirname(completo)
            for fr in yy.get("frames", []):
                png = os.path.join(pasta, fr["name"] + ".png")
                if not os.path.isfile(png):
                    problemas.append(f"[PNG FALTANDO] {caminho}: {fr['name']}.png")

        # scripts .gml
        if caminho.startswith("scripts/"):
            gml = os.path.join(os.path.dirname(completo), nome_esperado + ".gml")
            if not os.path.isfile(gml):
                problemas.append(f"[GML FALTANDO] {caminho}")

    # rooms na ordem que nao existem
    for n in proj["RoomOrderNodes"]:
        if n["roomId"]["path"] not in recursos:
            problemas.append(f"[ROOM FORA DOS RECURSOS] {n['roomId']['path']}")

    # .yy no disco que nao estao no .yyp (informativo)
    orfaos = []
    for tipo in ("sprites", "objects", "rooms", "scripts", "tilesets", "fonts", "sounds",
                 "paths", "timelines", "sequences", "shaders", "animcurves", "notes", "extensions"):
        base = os.path.join(ROOT, tipo)
        if os.path.isdir(base):
            for d in os.listdir(base):
                yy = f"{tipo}/{d}/{d}.yy"
                if os.path.isfile(os.path.join(ROOT, yy)) and yy not in recursos:
                    orfaos.append(yy)

    if problemas:
        print(f"=== {len(problemas)} PROBLEMA(S) ENCONTRADO(S) ===")
        for p in problemas:
            print(p)
    else:
        print("Nenhum problema estrutural encontrado.")

    if orfaos:
        print(f"\n(Info) {len(orfaos)} asset(s) existem no disco mas nao estao no .yyp:")
        for o in orfaos:
            print("  ", o)

except Exception:
    import traceback
    traceback.print_exc()
finally:
    print("\nResultado salvo em: resultado_diagnostico.txt")
    _arq.flush()
    input("Aperte Enter para fechar...")
