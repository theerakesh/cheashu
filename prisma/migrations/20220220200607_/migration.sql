/*
  Warnings:

  - The primary key for the `flat` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `marriageHall` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `review` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "flat" DROP CONSTRAINT "flat_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "marriageHall" DROP CONSTRAINT "marriageHall_ownerId_fkey";

-- DropForeignKey
ALTER TABLE "review" DROP CONSTRAINT "review_authorId_fkey";

-- DropForeignKey
ALTER TABLE "review" DROP CONSTRAINT "review_flatId_fkey";

-- DropForeignKey
ALTER TABLE "review" DROP CONSTRAINT "review_marriageHallId_fkey";

-- AlterTable
ALTER TABLE "flat" DROP CONSTRAINT "flat_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "ownerId" SET DATA TYPE TEXT,
ADD CONSTRAINT "flat_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "flat_id_seq";

-- AlterTable
ALTER TABLE "marriageHall" DROP CONSTRAINT "marriageHall_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "ownerId" SET DATA TYPE TEXT,
ADD CONSTRAINT "marriageHall_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "marriageHall_id_seq";

-- AlterTable
ALTER TABLE "review" DROP CONSTRAINT "review_pkey",
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "authorId" SET DATA TYPE TEXT,
ALTER COLUMN "marriageHallId" SET DATA TYPE TEXT,
ALTER COLUMN "flatId" SET DATA TYPE TEXT,
ADD CONSTRAINT "review_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "user" DROP CONSTRAINT "user_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "user_id_seq";

-- AddForeignKey
ALTER TABLE "marriageHall" ADD CONSTRAINT "marriageHall_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "flat" ADD CONSTRAINT "flat_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_marriageHallId_fkey" FOREIGN KEY ("marriageHallId") REFERENCES "marriageHall"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_flatId_fkey" FOREIGN KEY ("flatId") REFERENCES "flat"("id") ON DELETE SET NULL ON UPDATE CASCADE;
