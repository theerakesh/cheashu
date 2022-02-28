import { v4 as uuidv4 } from "uuid"

const Mutation = {
  createUser(parent, { data }, { prisma }, info) {
    // const emailTaken = await prisma.user.findFirst({
    //   where: {email: args.email}
    // })
    // if (emailTaken) {
    //   throw new Error("Email Taken")
    // }
    const user = {
      id: uuidv4(),
      ...data
    }
    return prisma.user.create({
      data: user
    })
  },
  createFlat(parent, { data }, { prisma }, info) {
    const flat = {
      id: uuidv4(),
      ...data
    }
    return prisma.flat.create({
      data: flat
    })
  },
  createMarriageHall(parent, { data }, { prisma }, info) {
    const marriageHall = {
      id: uuidv4(),
      ...data
    }
    return prisma.marriageHall.create({
      data: marriageHall
    })
  },
  createCommercialSpace(parent, { data }, { prisma }, info) {
    const commercialSpace = {
      id: uuidv4(),
      ...data
    }
    return prisma.commercialSpace.create({
      data: commercialSpace
    })
  },
  createReview(parent, { data }, { prisma }, info) {
    const review = {
      id: uuidv4(),
      ...data
    }
    return prisma.review.create({
      data: review
    })
  }
}

export { Mutation as default }