CREATE TABLE IF NOT EXISTS md_vehmenu_ui_settings (
    license2 VARCHAR(64) NOT NULL,  
    uiscale FLOAT NOT NULL DEFAULT 1.0,
    uileft INT NOT NULL DEFAULT 0,
    uitop INT NOT NULL DEFAULT 0,
    PRIMARY KEY (license2)
);