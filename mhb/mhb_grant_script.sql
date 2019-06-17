CREATE USER IF NOT EXISTS mhb_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON mhb.* TO mhb_user@localhost;