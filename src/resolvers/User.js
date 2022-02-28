const User = {
  marriageHall(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: parent.id }
    })
      .marriageHall()
    // return prisma.marriageHall.findMany({
    //   where: { ownerId: parent.id }
    // })
  },
  flat(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: parent.id }
    }).flat();
    // return prisma.flat.findMany({ 
    //   where: { ownerId: parent.id }
    // })
  },
  review(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: parent.id }
    }).review()
    // return prisma.review.findMany({
    //   where: { authorId: parent.id }
    // })
  }
}

export { User as default }