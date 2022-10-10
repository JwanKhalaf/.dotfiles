local present, prettier = pcall(require, "prettier")

if not present then
  return
end

prettier.setup {
  autoformat = 1,
  autoformat_require_pragma = 0
}
