/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `user` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "user_email_key";

-- CreateIndex
CREATE INDEX "review_authorId_idx" ON "review" USING HASH ("authorId");

-- CreateIndex
CREATE INDEX "review_marriageHallId_idx" ON "review" USING HASH ("marriageHallId");

-- CreateIndex
CREATE INDEX "review_flatId_idx" ON "review" USING HASH ("flatId");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");
