module.exports = (router) => {
    // let jwt = middlewares.jwt
    router.post("/api/menu/list", "menu.index")
    router.get("/api/menu/info/:id", "menu.info")
    router.post("/api/menu/add", "menu.add")
    router.post("/api/menu/edit", "menu.edit")
    router.get("/api/menu/delete/:id", "menu.delete")
};