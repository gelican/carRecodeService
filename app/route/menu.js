module.exports = (router) => {
    // let jwt = middlewares.jwt
    router.post("/api/menu/list", "menu.index")
};