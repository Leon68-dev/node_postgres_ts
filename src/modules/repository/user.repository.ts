import poolConnections from "../config/database.js"

export const createUserRpst = async (name: string, surname: string):Promise<any> => {
    try{
        //const newUser = await poolConnections.query(`INSERT INTO person(name, surname) values($1, $2) RETURNING *`, [name, surname]);
        const newUser = await poolConnections.query(`CALL public.insert_person($1, $2, $3)`, [name, surname, null]);
        return newUser?.rows[0];
    } catch(e) {
        await poolConnections.query(`ROLLBACK;`);
        console.error('insert_person', e);
        return null;
    }
}

export const getUsersRpst = async ():Promise<any[] | null> => {
    try {
        //const users = await poolConnections.query(`SELECT * FROM person`);
        await poolConnections.query(`BEGIN;`);
        await poolConnections.query(`CALL public.get_persons('result')`);
        const users = await poolConnections.query(`FETCH ALL IN "result";`);
        await poolConnections.query(`COMMIT;`);
        return users.rows;
    } catch(e) {
        await poolConnections.query(`ROLLBACK;`);
        console.error('get_person', e);
        return null;
    }
}

export const getOneUserRpst = async (id: number):Promise<any> => {
    try{
        //const user = await poolConnections.query(`SELECT * FROM person where id = $1`, [id]);
        await poolConnections.query(`BEGIN;`);
        await poolConnections.query(`CALL public.get_person_by_id($1, 'result')`, [id]);
        const user = await poolConnections.query(`FETCH ALL IN "result";`);
        await poolConnections.query(`COMMIT;`);
        return user?.rows[0] ?? [];
    } catch(e) {
        await poolConnections.query(`ROLLBACK;`);
        console.error('get_person_by_id', e);
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
        //const user = await poolConnections.query(`DELETE FROM person where id = $1`, [id]);
        await poolConnections.query(`CALL public.delete_person($1)`, [id]);
        return({});
    } catch(e) {
        await poolConnections.query(`ROLLBACK;`);
        console.error('delete_person', e);
        return null;
   }
}