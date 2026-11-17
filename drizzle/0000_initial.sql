CREATE TABLE `rooms` (
	`code` text PRIMARY KEY NOT NULL,
	`created_at` text NOT NULL
);
--> statement-breakpoint
CREATE TABLE `members` (
	`room_code` text NOT NULL,
	`token_hash` text NOT NULL,
	`name` text NOT NULL,
	`joined_at` text NOT NULL,
	PRIMARY KEY(`room_code`, `token_hash`),
	FOREIGN KEY (`room_code`) REFERENCES `rooms`(`code`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE TABLE `messages` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`room_code` text NOT NULL,
	`sender_token_hash` text NOT NULL,
	`text` text NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`room_code`, `sender_token_hash`) REFERENCES `members`(`room_code`,`token_hash`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `messages_room_id` ON `messages` (`room_code`,`id`);
