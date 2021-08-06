module.exports = (router) => {
    // let jwt = middlewares.jwt
    router.post("/api/role/list", "role.index")
    router.get("/api/role/info/:id", "role.info")
    router.post("/api/role/add", "role.add")
    router.post("/api/role/edit", "role.edit")
    router.get("/api/role/delete/:id", "role.delete")
};