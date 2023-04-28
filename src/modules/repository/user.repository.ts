import poolConnections from "../config/database.js"

export const createUserRpst = async (name: string, surname: string):Promise<any> => {
    try{
        const newUser = await poolConnections.query(`INSERT INTO person(name, surname) values($1, $2) RETURNING *`, [name, surname]);
        return newUser?.rows[0];
    } catch(e) {
        return null;
    }
}

export const getUsersRpst = async ():Promise<any[] | null> => {
    try {
        const users = await poolConnections.query(`SELECT * FROM person`);
        return users.rows;
    } catch(e) {
        return null;
    }
}

export const getOneUserRpst = async (userId: number):Promise<any> => {
    try{
        const user = await poolConnections.query(`SELECT * FROM person where id = $1`, [userId]);
        return user?.rows[0];
    } catch(e) {
        return null;
    }
}

export const updateUserRpst = async (id: number, name: string, surname: string):Promise<any> => {
    try{
        const user = await poolConnections.query(
            `UPDATE person SET name = $2, surname = $3 where id = $1 RETURNING *`, 
            [id, name, surname]
        );
        return user?.rows[0];
    } catch(e) {
        return null;
    }
}

export const deleteUserRpst = async (id: number):Promise<any> => {
    try{
        const user = await poolConnections.query(`DELETE FROM person where id = $1`, [id]);
        return(user?.rows[0]);
    } catch(e) {
        return null;
    }
}
