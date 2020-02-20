return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "2019.10.30",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 18,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 3,
  nextobjectid = 21,
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
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 25,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          id = 4,
          name = "soko",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 416,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 16,
          visible = true,
          properties = {
            ["collide"] = true,
            ["direction"] = "down"
          }
        },
        {
          id = 5,
          name = "snake",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 480,
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
          id = 6,
          name = "ltank",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 544,
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
          id = 7,
          name = "tank",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 544,
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
          id = 8,
          name = "stank",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 480,
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
          id = 9,
          name = "box",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 416,
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
          name = "",
          type = "text",
          shape = "text",
          x = 96,
          y = 32,
          width = 600,
          height = 200,
          rotation = 0,
          visible = true,
          text = "SOKO\nALL-STARS",
          fontfamily = "MS Shell Dlg 2",
          pixelsize = 84,
          wrap = true,
          bold = true,
          halign = "center",
          properties = {
            ["size"] = 56
          }
        },
        {
          id = 11,
          name = "",
          type = "text",
          shape = "text",
          x = 160,
          y = 384,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          text = "Warehouse keeper moves with arrow keys",
          wrap = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "text",
          shape = "text",
          x = 160,
          y = 448,
          width = 200,
          height = 60,
          rotation = 0,
          visible = true,
          text = "Snake needs space to turn; can't crawl backwards",
          wrap = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "text",
          shape = "text",
          x = 160,
          y = 512,
          width = 200,
          height = 60,
          rotation = 0,
          visible = true,
          text = "Needs to rotate before changing direction",
          wrap = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "text",
          shape = "text",
          x = 480,
          y = 384,
          width = 256,
          height = 60,
          rotation = 0,
          visible = true,
          text = "Push all boxes onto targets to win",
          wrap = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "text",
          shape = "text",
          x = 480,
          y = 512,
          width = 320,
          height = 60,
          rotation = 0,
          visible = true,
          text = "Left and right turns counter-clockwise and clockwise; up and down drives forward and backward",
          wrap = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "text",
          shape = "text",
          x = 480,
          y = 448,
          width = 320,
          height = 60,
          rotation = 0,
          visible = true,
          text = "Needs to rotate before changing direction, but can move in reverse",
          wrap = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "text",
          shape = "text",
          x = 0,
          y = 320,
          width = 800,
          height = 19,
          rotation = 0,
          visible = true,
          text = "U = Undo, R = Restart, Enter = Start game",
          wrap = true,
          halign = "center",
          properties = {
            ["size"] = 18
          }
        },
        {
          id = 19,
          name = "",
          type = "text",
          shape = "text",
          x = 0,
          y = 192,
          width = 800,
          height = 64,
          rotation = 0,
          visible = true,
          text = "by Tobias V. Langhoff\nPublic domain graphics by Kenney and Jim R. Kindley",
          wrap = true,
          halign = "center",
          properties = {}
        }
      }
    }
  }
}
