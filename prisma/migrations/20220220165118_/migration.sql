/*
  Warnings:

  - You are about to drop the `marriagehall` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "marriagehall" DROP CONSTRAINT "marriagehall_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "review" DROP CONSTRAINT "review_flatId_fkey";

-- DropForeignKey
ALTER TABLE "review" DROP CONSTRAINT "review_marriageHallId_fkey";

-- AlterTable
ALTER TABLE "review" ALTER COLUMN "marriageHallId" DROP NOT NULL,
ALTER COLUMN "flatId" DROP NOT NULL;

-- DropTable
DROP TABLE "marriagehall";

-- CreateTable
CREATE TABLE "marriageHall" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "pin" INTEGER NOT NULL,
    "area" DOUBLE PRECISION NOT NULL,
    "amenities" TEXT[],
    "ownerId" INTEGER NOT NULL,

    CONSTRAINT "marriageHall_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "marriageHall" ADD CONSTRAINT "marriageHall_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_marriageHallId_fkey" FOREIGN KEY ("marriageHallId") REFERENCES "marriageHall"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_flatId_fkey" FOREIGN KEY ("flatId") REFERENCES "flat"("id") ON DELETE SET NULL ON UPDATE CASCADE;
