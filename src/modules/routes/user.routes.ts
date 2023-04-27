import * as express from "express";
import UserController from "../controller/user.controller.js";

const userRouter = express.Router();

const userController = new UserController();
userRouter.post('/user', userController.createUser);
userRouter.get('/user', userController.getUsers);
userRouter.get('/user/:id', userController.getOneUser);
userRouter.put('/user', userController.updateUser);
userRouter.delete('/user/:id', userController.deleteUser);

export default userRouter;