function fn() {
    var env = karate.env; // obtener la propiedad del sistema java 'karate.env'
    karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'dev'; // un valor predeterminado personalizado
    }

    var config = {
        TokenID: '3182b759495609b99d729c4be4d70d0f0fb4e6ca6d10cb07420a0c5395b9afb0'
    };

    if (env == 'dev' || env == 'qa') {
        config.Authorization = 'Bearer ' + config.TokenID;
        config.urlBase = 'https://gorest.co.in/';
    }

    // Configurar tiempos de espera
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
}