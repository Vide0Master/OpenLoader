local gpu = component.proxy(component.list("gpu")())
local fss={}
boot_file="/init.lua"
for k,v in component.list("filesystem") do
    fss[#fss+1]=k
end

for i=1,#fss do
    local fs=component.proxy(fss[i])
    local files = fs.list("")
    for k,v in ipairs(files) do
        local b_file=""
        if v==boot_file then 
            local file = fs.open(v, 'r')
            local b_file=fs.read(file,math.huge)
            local exe, err=load(b_file)
            pcall(exe)
        end
    end
end
