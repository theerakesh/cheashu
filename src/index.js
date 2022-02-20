import { GraphQLServer, PubSub } from "graphql-yoga"
import { prisma } from "./database"
import Query from "./resolvers/Query"
import User from "./resolvers/User"
import Flat from "./resolvers/Flat"
import MarriageHall from "./resolvers/MarriageHall"
import Mutation from "./resolvers/Mutation"
import Review from "./resolvers/Review"

const pubsub = new PubSub()


const server = new GraphQLServer({
  typeDefs: './src/schema.graphql',
  resolvers: {
    Query,
    Mutation,
    User,
    Flat,
    MarriageHall,
    Review
  },
  context: {
    prisma,
    pubsub
  }
})

server.start(() => {
  console.log("server is running")
})