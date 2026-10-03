local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s({
        trig = "fu[nc]*",
        regTrig = true
    }, {
        i(1, "int"), t(" "), i(2, "foo"), t("("), i(3), t(")"), t(" "),
        t({ "{" }),
        t({ "", "\t" }), i(0),
        t({ "", "}" })
    })
}

