import prisma from '$lib/prisma.js';

export async function load() {
  const users = await prisma.user.findMany();
  return {
    users
  };
}