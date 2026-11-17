ALTER TABLE `messages` ADD COLUMN `original_text` text;
--> statement-breakpoint
ALTER TABLE `messages` ADD COLUMN `translation_language` text;
--> statement-breakpoint
UPDATE `messages` SET `original_text` = `text` WHERE `original_text` IS NULL;
