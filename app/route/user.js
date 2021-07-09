module.exports = (router) => {
    // let jwt = middlewares.jwt
    router.post("/api/user/login", "user.login")
    router.post("/api/user/register", "user.register")
};