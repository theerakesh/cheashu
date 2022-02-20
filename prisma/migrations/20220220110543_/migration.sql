-- CreateTable
CREATE TABLE "student" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255),
    "email" VARCHAR(255) NOT NULL,
    "phone" VARCHAR(255),
    "marriageHallId" INTEGER NOT NULL,
    "flatId" INTEGER NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "marriagehall" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL,
    "pin" INTEGER NOT NULL,
    "area" DOUBLE PRECISION NOT NULL,
    "amenities" TEXT[],
    "ownerId" INTEGER NOT NULL,

    CONSTRAINT "marriagehall_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "flat" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "pin" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "amenities" TEXT[],
    "ownerId" INTEGER NOT NULL,

    CONSTRAINT "flat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "review" (
    "id" INTEGER NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "body" VARCHAR(4098) NOT NULL,
    "authorId" INTEGER NOT NULL,
    "marriageHallId" INTEGER NOT NULL,
    "flatId" INTEGER NOT NULL,

    CONSTRAINT "review_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "student_email_key" ON "student"("email");

-- AddForeignKey
ALTER TABLE "marriagehall" ADD CONSTRAINT "marriagehall_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "flat" ADD CONSTRAINT "flat_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_marriageHallId_fkey" FOREIGN KEY ("marriageHallId") REFERENCES "marriagehall"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "review" ADD CONSTRAINT "review_flatId_fkey" FOREIGN KEY ("flatId") REFERENCES "flat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
