###########################################################
Smashville Balloon gives 1 stock to its attacker [Eon]
###########################################################
.include "Source/CM_Addons/AddonAliases.asm"

#Code Menu Variant by mawwwk, with thanks to Desi for the format


HOOK @ $80979BE4 #at the `return True` of `onDamage/[ykDamageModuleImpl]/yk_damage_module_impl.o`
{
    lwz r3, 0x70(r31)   #get Module 
    lwz r3, 0(r3)       #getModuleName
    lwz r3, 0(r3)
    lis r4, 0x6772      #"gr"
    ori r4, r4, 0x5669  #"Vi"
    cmpw r3, r4         #if obj-type.startsWith("grVi") (to find "grVillageBalloon")
    bne end             #else end 
    # is a balloon

    #this.Modules.soDamage.getAttackerInfo()
    lwz r3, 0x60(r31)
    lwz r3, 0xD8(r3) 
    lwz r3, 0x38(r3)
    lwz r12, 0x8(r3)
    lwz r12, 0x94(r12)
    mtctr r12
    bctrl 
    mr r30, r3
    #TaskScheduler.getInstance()
    lis r12, 0x8002
    ori r12, r12, 0xE30C
    mtctr r12
    bctrl 
    #taskScheduler.getTaskById(attackerType, attackerID)
    lbz r4, 0x10(r30)
    lwz r5, 0x14(r30)
    lis r12, 0x8002
    ori r12, r12, 0xF018
    mtctr r12
    bctrl
    cmpwi r3, 0
    beq end
    #attacker.getOwner()
    lwz r12, 0x3C(r3)
    lwz r12, 0x2EC(r12)
    mtctr r12
    bctrl 
    mr r30, r3
    #attackerOwner.getStockCount()
    lis r12, 0x8081
    ori r12, r12, 0xC540
    mtctr r12
    bctrl
    
    lis r12, BALLOOON_BALLOOON_LOC_HI          #
    ori r12, r12, BALLOOON_BALLOOON_LOC_LO    # Load Code Menu Header
    lwz r12, 0 (r12)
    lbz r12, 0xB(r12)
    cmpwi r12, 0                    # If (CodeMenuVar == 0), don't affect stocks
    beq end 
    
    cmpwi r12, 1                    # Else if (CodeMenuVar == 1), add a stock to attacker
    beq AddStock
    
    subi r4, r3, 1                  # Else, subtract a stock
    b return
    
    #attackerOwner.setStockCount(prevStockCount+1)
    AddStock:
      addi r4, r3, 1
      b return
    
    return:
      mr r3, r30
      lis r12, 0x8081
      ori r12, r12, 0xC528
      mtctr r12
      bctrl 
end:
    li r3,1 
}