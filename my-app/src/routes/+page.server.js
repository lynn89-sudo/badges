import prisma from '$lib/prisma.js';

export async function load() {
  const clubs = await prisma.club.findMany();
  return {
    clubs
  };
}