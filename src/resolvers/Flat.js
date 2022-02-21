const Flat = {
  owner(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: parent.ownerId }
    })
  },
  review(parent, args, { prisma }, info) {
    return prisma.review.findMany({
      where: { flatId: parent.id }
    })
  }
}

export { Flat as default }