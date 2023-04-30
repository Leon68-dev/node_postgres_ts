import * as express from "express";
import { createUserCtrl, deleteUserCtrl, getOneUserCtrl, getUsersCtrl, getUsersProcedureCtrl, updateUserCtrl } from "../controller/user.controller.js";

const userRouter = express.Router();

userRouter.post('/user', createUserCtrl);
userRouter.get('/user', getUsersCtrl);
userRouter.get('/user/:id', getOneUserCtrl);
userRouter.put('/user', updateUserCtrl);
userRouter.delete('/user/:id', deleteUserCtrl);

userRouter.get('/user_prc', getUsersProcedureCtrl);

export default userRouter;