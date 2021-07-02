module.exports = (router) => {
    // let jwt = middlewares.jwt
    router.post("/api/user", "user.info")
    router.post("/api/user/login", "user.login")
};