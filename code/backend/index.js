require('dotenv').config();
const express = require('express');
const { Pool } = require('pg');

const app = express();
const port = process.env.PORT || 3000;

const pool = new Pool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: 5432,
    ssl: {
        rejectUnauthorized: false, // Chấp nhận mọi chứng chỉ CA
    },
});

app.get('/api/hello', async (req, res) => {
    const result = await pool.query('SELECT NOW()');
    console.log("connecting to database");
    res.json({ message: 'Hello from DB!', time: result.rows[0].now });
});
app.get('/api/health', async (req, res) => {

    res.json({ message: 'Alive' });
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);

});
