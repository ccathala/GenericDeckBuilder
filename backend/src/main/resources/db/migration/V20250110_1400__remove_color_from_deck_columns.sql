-- Migration to remove color_hex column from deck_column_group table
-- This migration removes the color functionality from deck columns

ALTER TABLE deck_column_group DROP COLUMN IF EXISTS color_hex;
