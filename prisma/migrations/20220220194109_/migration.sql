/*
  Warnings:

  - You are about to drop the column `flatId` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `marriageHallId` on the `user` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "user" DROP COLUMN "flatId",
DROP COLUMN "marriageHallId";
