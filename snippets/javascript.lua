local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("javascript", {
    s({
        trig = "fu",
        regTrig = true
    }, {
        t("function "), i(1, "foo"), t("("), i(2, "x"), t(") {"),
        t({ "", "\t" }), i(0), -- Moves your cursor inside the indented body
        t({ "", "}" })         -- Closes the bracket on a new line
    })
})

ls.add_snippets("javascript", {
    s({
        trig = "fua",
        regTrig = true
    }, {
        t("function "), i(1, "bar"), t("("),
        i(2, "a"), t(", "), i(3, "b"), t(") {"),
        t({ "", "\t" }), i(0), -- Moves your cursor inside the indented body
        t({ "", "}" })         -- Closes the bracket on a new line
    })
})

ls.add_snippets("javascript", {
    s({
        trig = "fub",
        regTrig = true
    }, {
        t("function "), i(1, "baz"), t("("),
        i(2, "a"), t(", "), i(3, "b"), t(", "), i(4, "c"),
        t(") {"),
        t({ "", "\t" }), i(0), -- Moves your cursor inside the indented body
        t({ "", "}" })         -- Closes the bracket on a new line
    })
})

