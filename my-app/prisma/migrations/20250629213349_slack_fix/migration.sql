/*
  Warnings:

  - You are about to drop the column `accessToken` on the `Club` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Club" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "repo" TEXT,
    "slackId" TEXT,
    "email" TEXT
);
INSERT INTO "new_Club" ("email", "id", "name", "repo", "slackId") SELECT "email", "id", "name", "repo", "slackId" FROM "Club";
DROP TABLE "Club";
ALTER TABLE "new_Club" RENAME TO "Club";
CREATE UNIQUE INDEX "Club_slackId_key" ON "Club"("slackId");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
