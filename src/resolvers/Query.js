const Query = {
  me() {
    return "hello"
  },
  users(parent, args, { prisma }, info) {
    return prisma.user.findMany({})
  },
  flats(parent, args, { prisma }, info) {
    return prisma.flat.findMany({})
  },
  marriageHalls(parent, args, { prisma }, info) {
    return prisma.marriageHall.findMany({})
  },
  reviews(parent, args, { prisma }, info) {
    return prisma.review.findMany({})
  }
}

export default Query