CREATE TABLE `inscricao`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `atleta` BIGINT NOT NULL,
    `cavalo` BIGINT NOT NULL,
    `dia` BIGINT NOT NULL,
    `evento` BIGINT NOT NULL,
    `altura` BIGINT NOT NULL,
    `categoria` BIGINT NOT NULL
);
CREATE TABLE `entidade`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `usuario` BIGINT NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `endereco` TEXT NOT NULL
);
CREATE TABLE `usuario`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `senha` VARCHAR(255) NOT NULL
);
CREATE TABLE `atleta`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `usuario` BIGINT NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `nascimento` DATE NOT NULL,
    `documento` VARCHAR(255) NOT NULL
);
CREATE TABLE `evento`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `entidade` BIGINT NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    `descricao` TEXT NOT NULL,
    `inicio` DATE NOT NULL,
    `fim` DATE NOT NULL
);
CREATE TABLE `dia`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `evento` BIGINT NOT NULL,
    `data` DATE NOT NULL
);
CREATE TABLE `categoria`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `altura` BIGINT NOT NULL,
    `nome` VARCHAR(255) NOT NULL
);
CREATE TABLE `cavalo`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `usuario` BIGINT NOT NULL,
    `nome` BIGINT NOT NULL
);
CREATE TABLE `altura`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `dia` BIGINT NOT NULL,
    `altura` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `dia` ADD CONSTRAINT `dia_evento_foreign` FOREIGN KEY(`evento`) REFERENCES `evento`(`id`);
ALTER TABLE
    `inscricao` ADD CONSTRAINT `inscricao_dia_foreign` FOREIGN KEY(`dia`) REFERENCES `dia`(`id`);
ALTER TABLE
    `inscricao` ADD CONSTRAINT `inscricao_atleta_foreign` FOREIGN KEY(`atleta`) REFERENCES `atleta`(`id`);
ALTER TABLE
    `inscricao` ADD CONSTRAINT `inscricao_cavalo_foreign` FOREIGN KEY(`cavalo`) REFERENCES `cavalo`(`id`);
ALTER TABLE
    `categoria` ADD CONSTRAINT `categoria_altura_foreign` FOREIGN KEY(`altura`) REFERENCES `altura`(`id`);
ALTER TABLE
    `inscricao` ADD CONSTRAINT `inscricao_altura_foreign` FOREIGN KEY(`altura`) REFERENCES `altura`(`id`);
ALTER TABLE
    `altura` ADD CONSTRAINT `altura_dia_foreign` FOREIGN KEY(`dia`) REFERENCES `dia`(`id`);
ALTER TABLE
    `atleta` ADD CONSTRAINT `atleta_usuario_foreign` FOREIGN KEY(`usuario`) REFERENCES `usuario`(`id`);
ALTER TABLE
    `inscricao` ADD CONSTRAINT `inscricao_evento_foreign` FOREIGN KEY(`evento`) REFERENCES `evento`(`id`);
ALTER TABLE
    `evento` ADD CONSTRAINT `evento_entidade_foreign` FOREIGN KEY(`entidade`) REFERENCES `entidade`(`id`);
ALTER TABLE
    `cavalo` ADD CONSTRAINT `cavalo_usuario_foreign` FOREIGN KEY(`usuario`) REFERENCES `usuario`(`id`);
ALTER TABLE
    `inscricao` ADD CONSTRAINT `inscricao_categoria_foreign` FOREIGN KEY(`categoria`) REFERENCES `categoria`(`id`);
ALTER TABLE
    `entidade` ADD CONSTRAINT `entidade_usuario_foreign` FOREIGN KEY(`usuario`) REFERENCES `usuario`(`id`);