const CommercialSpace = {
  owner(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: parent.ownerId }
    })
  },
  review(parent, args, { prisma }, info) {
    return prisma.commercialSpace.findUnique({
      where: { id: parent.id }
    }).review()
    // return prisma.review.findMany({
    //   where: { CommercialSpaceId: parent.id }
    // })
  }
}

export { CommercialSpace as default }