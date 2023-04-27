import pkg from 'pg';

const { Pool } = pkg;

const poolConnections = new Pool({
    user: 'postgres',
    password: '`12345',
    host: 'localhost',
    port: 5432,
    database: 'node_postgres'
});

export default poolConnections;