import * as express from "express";
import { createUserCtrl, deleteUserCtrl, getOneUserCtrl, getUsersCtrl, updateUserCtrl } from "../controller/user.controller.js";

const userRouter = express.Router();

userRouter.post('/user', createUserCtrl);
userRouter.get('/user', getUsersCtrl);
userRouter.get('/user/:id', getOneUserCtrl);
userRouter.put('/user', updateUserCtrl);
userRouter.delete('/user/:id', deleteUserCtrl);

export default userRouter;