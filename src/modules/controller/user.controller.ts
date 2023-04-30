import { Request, Response } from "express";
import { createUserRpst, deleteUserRpst, getOneUserRpst, getUsersRpst, updateUserRpst } from "../repository/user.repository.js"

export const createUserCtrl = async (req:Request, res:Response): Promise<void> => {
    try{
        const { name, surname } = req.body;
        const newUser = await createUserRpst(name, surname);
        res.json(newUser);
    } catch(e) {
        res.status(500).json(e);
    }
}

export const getUsersCtrl = async (req:Request, res:Response): Promise<void> => {
    try {
        const users = await getUsersRpst();    
        res.json(users);
    } catch(e) {
        res.status(500).json(e);
    }
}
   
export const getOneUserCtrl = async (req:Request, res:Response): Promise<void> => {
    try{
        const id = req.params.id;
        const user = await getOneUserRpst(Number(id));
        res.json(user);
    } catch(e) {
        res.status(500).json(e);
    }
}

export const  updateUserCtrl = async (req:Request, res:Response): Promise<void> => {
    try{
        const { id, name, surname } = req.body;
        const user = await updateUserRpst(Number(id), name, surname);
        res.json(user);
    } catch(e) {
        res.status(500).json(e);
    }
}

export const deleteUserCtrl = async (req:Request, res:Response): Promise<void> => {
    try{
        const id = req.params.id;
        const res = await deleteUserRpst(Number(id));
        res.json(res);
    } catch(e) {
        res.status(500).json(e);
    }
}
