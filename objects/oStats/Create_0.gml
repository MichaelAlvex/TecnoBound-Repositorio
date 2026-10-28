if (!variable_global_exists("stat_passos")) {
    global.stat_passos = 0;
}

if (!variable_global_exists("stat_andares")) {
    global.stat_andares = 0;
}

if (!variable_global_exists("stat_total_minerios")) {
    global.stat_total_minerios = 0;
}

if (!variable_global_exists("stat_total_monstros")) {
    global.stat_total_monstros = 0;
}

if (!variable_global_exists("stat_pedidos")) {
    global.stat_pedidos = 0;
}

if (!variable_global_exists("minerios_quebrados")) {
    global.minerios_quebrados = {
        "Quartzo": 0,
        "Grafite": 0,
        "Cobre": 0,
        "Bauxita": 0,
        "Ouro": 0,
        "Tungstênio": 0
    };
}

if (!variable_global_exists("monstros_derrotados")) {
    global.monstros_derrotados = {
        "Slime": 0,
        "Morcego": 0,
        "Aranha": 0,
        "Boss de gelo": 0,
        "Boss de terra": 0,
        "Boss de lava": 0
    };
}