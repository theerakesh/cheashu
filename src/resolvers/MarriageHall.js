const MarriageHall = {
  owner(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: parent.ownerId }
    })
  },
  review(parent, args, { prisma }, info) {
    return prisma.review.findMany({
      where: { marriageHallId: parent.id }
    })
  }
}

export { MarriageHall as default }