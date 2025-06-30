/*
  Warnings:

  - You are about to drop the column `url` on the `Club` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Club" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "repo" TEXT,
    "slackId" TEXT,
    "email" TEXT,
    "accessToken" TEXT
);
INSERT INTO "new_Club" ("email", "id", "name") SELECT "email", "id", "name" FROM "Club";
DROP TABLE "Club";
ALTER TABLE "new_Club" RENAME TO "Club";
CREATE UNIQUE INDEX "Club_slackId_key" ON "Club"("slackId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
