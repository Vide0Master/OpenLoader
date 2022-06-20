local gpu = component.proxy(component.list("gpu")())
local fss = component.list("filesystem")

while true do
    for i=1,#fss do
        gpu.set(1,i,i.."."..fss[i])
    end
end
