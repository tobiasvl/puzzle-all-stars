return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "2020.02.12",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 12,
  height = 12,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 4,
  nextobjectid = 11,
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
      objectalignment = "unspecified",
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
          id = 14,
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
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      id = 2,
      name = "Ground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 6, 1, 1, 6, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 6, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      id = 1,
      name = "Walls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
        15, 15, 0, 15, 15, 15, 15, 15, 15, 0, 15, 15,
        15, 0, 0, 0, 0, 15, 15, 0, 0, 0, 0, 15,
        15, 0, 0, 15, 15, 15, 15, 15, 15, 0, 0, 15,
        15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15,
        15, 15, 0, 0, 0, 15, 0, 15, 0, 0, 15, 15,
        15, 15, 15, 15, 15, 15, 0, 15, 15, 15, 15, 15,
        15, 15, 0, 0, 0, 15, 0, 15, 0, 0, 15, 15,
        15, 15, 0, 15, 0, 15, 0, 15, 0, 0, 15, 15,
        15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15,
        15, 15, 15, 15, 15, 0, 0, 0, 15, 15, 15, 15,
        15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "Object Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["walkable"] = false
      },
      objects = {
        {
          id = 1,
          name = "soko",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 320,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 16,
          visible = true,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 2,
          name = "box",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 14,
          visible = true,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 4,
          name = "tank",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 36,
          visible = true,
          properties = {
            ["collide"] = true,
            ["direction"] = "right"
          }
        },
        {
          id = 9,
          name = "box",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 14,
          visible = true,
          properties = {
            ["collide"] = true
          }
        },
        {
          id = 10,
          name = "box",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 14,
          visible = true,
          properties = {
            ["collide"] = true
          }
        }
      }
    }
  }
}
