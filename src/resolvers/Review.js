const Review = {
  author(parent, args, { prisma }, info) {
    return prisma.user.findUnique({
      where: { id: parent.authorId }
    })
  }
}

export { Review as default }