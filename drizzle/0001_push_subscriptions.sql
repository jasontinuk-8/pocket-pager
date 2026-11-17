CREATE TABLE `push_subscriptions` (
	`endpoint` text PRIMARY KEY NOT NULL,
	`room_code` text NOT NULL,
	`member_token_hash` text NOT NULL,
	`p256dh` text NOT NULL,
	`auth_key` text NOT NULL,
	`created_at` text NOT NULL,
	FOREIGN KEY (`room_code`, `member_token_hash`) REFERENCES `members`(`room_code`,`token_hash`) ON UPDATE no action ON DELETE cascade
);
--> statement-breakpoint
CREATE INDEX `push_subscriptions_room_member` ON `push_subscriptions` (`room_code`,`member_token_hash`);
