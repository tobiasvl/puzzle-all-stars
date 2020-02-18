return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "2019.10.30",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 6,
  height = 6,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 9,
  nextobjectid = 56,
  properties = {},
  tilesets = {
    {
      name = "ltank",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 10,
      image = "assets/ltank.png",
      imagewidth = 320,
      imageheight = 192,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 60,
      tiles = {
        {
          id = 1,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 2,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 3,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 4,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 8,
          properties = {
            ["die"] = true
          }
        },
        {
          id = 9,
          properties = {
            ["die"] = true
          }
        },
        {
          id = 10,
          properties = {
            ["die"] = true
          }
        },
        {
          id = 13,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 14,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 15,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 16,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 17,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 35,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 36,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 37,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 38,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 39,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 40,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 41,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 42,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 43,
          properties = {
            ["collide"] = true
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 7,
      name = "Ground",
      x = 0,
      y = 0,
      width = 6,
      height = 6,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        6, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1,
        1, 11, 6, 1, 1, 1,
        1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 11
      }
    },
    {
      type = "tilelayer",
      id = 8,
      name = "Walls",
      x = 0,
      y = 0,
      width = 6,
      height = 6,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 15,
        15, 15, 15, 0, 0, 15,
        15, 0, 0, 0, 0, 15,
        15, 15, 15, 0, 15, 15,
        15, 15, 15, 0, 15, 15,
        15, 15, 15, 0, 15, 15
      }
    },
    {
      type = "objectgroup",
      id = 2,
      name = "Object Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {
        ["walkable"] = false
      },
      objects = {
        {
          id = 41,
          name = "ltank",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 2,
          visible = true,
          properties = {}
        },
        {
          id = 42,
          name = "soko",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 16,
          visible = true,
          properties = {}
        },
        {
          id = 43,
          name = "snake",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 96,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 17,
          visible = true,
          properties = {}
        },
        {
          id = 44,
          name = "box",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 14,
          visible = true,
          properties = {}
        },
        {
          id = 47,
          name = "box",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 32,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 14,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
