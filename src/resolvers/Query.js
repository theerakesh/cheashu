const Query = {
  me() {
    return "hello"
  },
  users(parent, args, { prisma }, info) {
    return prisma.user.findMany({})
  },
  user(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: args.id }
    })
  },
  flats(parent, args, { prisma }, info) {
    return prisma.flat.findMany({})
  },
  flat(parent, args, { prisma }, info) {
    return prisma.flat.findUnique({
      where: { id: args.id }
    })
  },
  marriageHalls(parent, args, { prisma }, info) {
    return prisma.marriageHall.findMany({})
  },
  marriageHall(parent, args, { prisma }, info) {
    return prisma.marriageHall.findUnique({
      where: { id: args.id }
    })
  },
  reviews(parent, args, { prisma }, info) {
    return prisma.review.findMany({})
  },
  review(parent, args, { prisma }, info) {
    return prisma.review.findUnique({
      where: { id: args.id }
    })
  }
}

export default Query