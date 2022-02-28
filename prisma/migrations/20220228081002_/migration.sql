/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `user` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "user_email_key";

-- AlterTable
ALTER TABLE "flat" ADD COLUMN     "photos" TEXT[];

-- AlterTable
ALTER TABLE "marriageHall" ADD COLUMN     "photos" TEXT[];

-- AlterTable
ALTER TABLE "review" ADD COLUMN     "commercialSpaceId" TEXT;

-- AlterTable
ALTER TABLE "user" ADD COLUMN     "profilePic" TEXT NOT NULL DEFAULT E'https://avatars.githubusercontent.com/u/78639550?s=48&v=4';

-- CreateTable
CREATE TABLE "commercialSpace" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "address" VARCHAR(2048) NOT NULL,
    "pin" INTEGER NOT NULL,
    "area" DOUBLE PRECISION NOT NULL,
    "distance_from_road" DOUBLE PRECISION NOT NULL,
    "availability" BOOLEAN NOT NULL DEFAULT false,
    "amenities" TEXT[],
    "photos" TEXT[],
    "suitable_for" TEXT[],
    "coordinate" TEXT[],
    "ownerId" TEXT NOT NULL,

    CONSTRAINT "commercialSpace_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "review_commercialSpaceId_idx" ON "review" USING HASH ("commercialSpaceId");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "commercialSpace" ADD CONSTRAINT "commercialSpace_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_commercialSpaceId_fkey" FOREIGN KEY ("commercialSpaceId") REFERENCES "commercialSpace"("id") ON DELETE SET NULL ON UPDATE CASCADE;
