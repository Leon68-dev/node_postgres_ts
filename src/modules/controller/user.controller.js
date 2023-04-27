import poolConnections from "../config/database.js"

class UserController {
    createUser = async (req, res) => {
        try{
            const { name, surname } = req.body;
            console.log(name, surname);
            const newPerson = await poolConnections.query(`INSERT INTO person(name, surname) values($1, $2) RETURNING *`, [name, surname]);
            res.json(newPerson?.rows[0]);
        } catch(e) {
            res.status(500).json(e);
        }
    }

    getUsers = async (_req, res) => {
        try {
            const users = await poolConnections.query(`SELECT * FROM person`);
            res.json(users?.rows);
        } catch(e) {
            res.status(500).json(e);
        }
    }

    getOneUser = async (req, res) => {
        try{
            const id = req.params.id;
            const user = await poolConnections.query(`SELECT * FROM person where id = $1`, [id]);
            res.json(user?.rows[0]);
        } catch(e) {
            res.status(500).json(e);
        }
    }

    updateUser = async (req, res) => {
        try{
            const { id, name, surname } = req.body;
            const user = await poolConnections.query(
                `UPDATE person SET name = $2, surname = $3 where id = $1 RETURNING *`, 
                [id, name, surname]);
            res.json(user?.rows[0]);
        } catch(e) {
            res.status(500).json(e);
        }
    }

    deleteUser = async (req, res) => {
        try{
            const id = req.params.id;
            const user = await poolConnections.query(`DELETE FROM person where id = $1`, [id]);
            res.json(user?.rows[0]);
        } catch(e) {
            res.status(500).json(e);
        }
    }
}

export default UserController;