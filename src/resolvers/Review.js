const Review = {
  author(parent, args, { prisma }, info) {
    return prisma.user.findFirst({
      where: { id: parent.authorId }
    })
  },
  flat(parent, args, { prisma }, info) {
    if (!parent.flatId) {
      return []
    }
    return prisma.flat.findFirst({
      where: { id: parent.flatId }
    })
  },
  marriageHall(parent, args, { prisma }, info) {
    if (!parent.marriageHallId) {
      return []
    }
    return prisma.marriageHall.findFirst({
      where: { id: parent.marriageHallId }
    })
  }
}

export { Review as default }