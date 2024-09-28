import streamlit as st
from PIL import Image, ImageDraw
import base64

class titulo:
    def __init__(self, level, text):
        self.level = level
        self.text = text
    def create(self):
        html_code = f'<h{self.level} style = "text-align: left; color: black;">{self.text}</h{self.level}>'
        return st.markdown(html_code, unsafe_allow_html = True)
class texto:
    def __init__(self, text):
        self.text = text
    def create(self):
        html_code = f'<div style = "text-align: justify; color: black;">{self.text}</div>'
        return st.markdown(html_code, unsafe_allow_html = True)

def add_corners(im):
    rad = 50
    circle = Image.new('L', (rad * 2, rad * 2), 0)
    draw = ImageDraw.Draw(circle)
    draw.ellipse((0, 0, rad * 2 - 1, rad * 2 - 1), fill=255)
    alpha = Image.new('L', im.size, 255)
    w, h = im.size
    alpha.paste(circle.crop((0, 0, rad, rad)), (0, 0))
    alpha.paste(circle.crop((0, rad, rad, rad * 2)), (0, h - rad))
    alpha.paste(circle.crop((rad, 0, rad * 2, rad)), (w - rad, 0))
    alpha.paste(circle.crop((rad, rad, rad * 2, rad * 2)), (w - rad, h - rad))
    im.putalpha(alpha)
    return im
def edit_image(image):
    return add_corners(image).resize((1000, 550))
@st.cache_data()
def load_resources(load):
    img29 = edit_image(Image.open(r'Imagenes/mod_planas.png'))
    img30 = edit_image(Image.open(r'Imagenes/mod_trapezoidales.png'))
    img31 = edit_image(Image.open(r'Imagenes/mod_cadenas.png'))
    img32 = edit_image(Image.open(r'Imagenes/mod_engranajes.png'))
    img33 = edit_image(Image.open(r'Imagenes/mod_ejes1.png'))
    img34 = edit_image(Image.open(r'Imagenes/mod_ejes2.png'))
    img35 = edit_image(Image.open(r'Imagenes/mod_ejes3.png'))
    img36 = edit_image(Image.open(r'Imagenes/mod_ejes4.png'))
    img37 = edit_image(Image.open(r'Imagenes/mod_plano.png'))

    file_2   = open(r'ReadmeRSC/belt.gif', "rb")
    content2 = file_2.read()
    gif2     = base64.b64encode(content2).decode("utf-8")
    file_2.close()
    file_3   = open(r'ReadmeRSC/gear.gif', "rb")
    content3 = file_3.read()
    gif3     = base64.b64encode(content3).decode("utf-8")
    file_3.close()
    file_5   = open(r'Imagenes/shaftanim.gif', "rb")
    content5 = file_5.read()
    gif5     = base64.b64encode(content5).decode("utf-8")
    file_5.close()

    url1 = 'https://viewer.diagrams.net/?nav=1&title=#R7V1rd5u60v41%2BdgsQFw%2Fuonb03fltpLsfXbPN4yxQ4vBG3Db9Ne%2FkkDcJGxsBAK7Z62za8uIwOiZ0cxoLlfgZvPrc2Rv3%2B7DpetfKdLy1xW4vVIUVdYl%2BA8aeU9HFMvKRtaRt0zH5GLgxfvtZoPksp23dOPKhUkY%2Bom3rQ46YRC4TlIZs6Mo%2FFm9bBX61b%2B6tdfZX5SKgRfH9l3qsv96y%2BQtHdVMUIz%2Fx%2FXWbwl54%2ByHjU2uze4bv9nL8GdpCMyvwE0Uhkn6afPrxvUR8QhZ0nmfGn7Nnytyg6TVBFVJp%2Fyw%2FV32ck%2BP%2F50%2Fw6GXry%2Bv83v44fV59vBy%2F%2BXl5cvjA%2Fx6M7u7%2Betu9vr4nL1D8k7oEv%2F0Nr4dwG8fnTfPX97Z7%2BEOPUic2M538u1j5MZwSZ%2FIU8q1oXsbIUWCo29h5P0Og8T2s8vgfaIkw4MsVS95QX%2BDTEw2ZMoK%2FpjN0NBPNIkyqv1wo8T9VRrKSPbZDTduEr3DSwiCs9XL4PtBMbOBnwUYFMky08G3MhIUI7vUziC4zu9eLBP8kK1U06oZ1KrdX92AKwvc%2FnX3CH%2B4naOFenx%2Bns9e4Kenu9kD%2FnClffz0%2BPzx8Uq73bd4ZTLr1EI0Exg0EDhH2WESvxNOb0tSXeNAUcWUKYpSBFpH4W7Lejuj4e1yAWQv%2FLI8aQSWaVSAJQP5WtEoOsiWrNF0AKZxrXHAlkZTArKljW4UxujCwHM8KAljij6QPMHSXWaw%2BPnmJe7L1nbQrz%2FhRlBFjRNuPCcDE03TYj1aM6Vm0IQijFqmk8GFSLTYvFJ0Hwm3pfejQhb93x2S5h8rn9bZv3hGvLUD5pQFFGhrTNUPTuiH0RWYpQuQeIgRGbf8gJg9TNwALhHaYPHGuwkTOFfR7Q1ag2ARb%2FEMaaRD1Hc%2FfcNPKZ2qtIPDmODVUeFr8Px0P1Xy%2F1nK6lLeemhnnclYAOJFhf%2FxEXdtQ99F%2F27cgOsCnymVoPbXMxtMk3BQ2crENdz%2BIpeQLB4DA49zKRDdPtsbG2tKihS5zm4ReRsP0q%2BKPSeMIgS%2Bxqfr%2FBiv3jbMHiOGf95b5g%2Bw9jJG6GMPaPdCdQX%2Fzd6ij1DRsn3f9cM1VOvghVsXEs9N3Kj%2B21PxwyF1buX9comhjr7bvrcO4GcHEgXP76bjEYVYyXXcsl2gqbSal%2Bt%2BnfQ8Q6eo6C7X7kv2NQixuVSiA2Lh93%2BQXgsfNPv6NVNz8ZfbX5Vv74dV4DjcRQ5xPBDtHBpoa5e8KtFG0aPtJWPk%2Bnbi%2Fah6MbopwoBWhOFGYMrBeufnvOAg09HBzElknI8EXC7pMANVWFbaQlvU3mNjSIdBycWuAAaoGGUmC4KAOHQqlikXBFp7ERhGyVu4DgPbnxejFUD%2B8pJ%2FSp%2B%2FFtiE3wo0oi%2FvZWj%2BU%2F7ytYroriBWWCAG4kCsUiD%2BG4pAx1vaS%2BZ%2Bkg4lkR3EGy%2FGqs9HEIwQrLI%2BMFqNY%2BXlZOCpioOnRsHz086Nftv4GYM1tvb9CaFSUYdFJXHPnr8M1YSB1DQF0ljuicbqIDTGU2dRZL%2BXLtiGXpDEpTs%2FoYGCpwytJuktwlOfWs5QjNoM%2BCF9imLF89dpKanoc4mb0F15DjLNkMe4SUSl9ssiIrZL7K53Adl116mpV2zD9PUHtMYhLR8uEtOUa6vLlJgKy7%2Bdn5x0Y%2Bf9G%2Fk0RSZgsbMhbl83KW65C4O1l%2BwatM6xmESyrFfhOfB2rpwhNg0WNk1x2LQobM4C543tXhsvMAc21k31UpBpCUOmTiPzE%2FIAF2ee6LkghWxnRCYQhcyhLXNzvyfzfKCpC4MmUPb76mjvR9sXJUFDlRc1xDnMyPOwPBKM7cFFqjw%2BB4GqNfZUOGGQ2gHOqJl0cEeFdiFMSgAkArt0fNNx2I29SWAXDK2Vg0vBriwOu0ozdiM33vmJHSQufosFPmXDwHW%2FuVeNnpcSwNPr%2FjcGMGuWVtOW9EHBbJ2hx5itRCjiwEwfHXMH89cxgllRBwazTFFh%2BmBmxUGI1IjpI%2BR7eJs0IIkXmv8ZI5qBMjCaz9CQZYtmcSfO1hl6%2F9kSQxyNVZ2WGPtyeF6fZ0%2Fz%2Fz1%2BuZ3dzbNUnsen1y8f53evo8%2FmMUiOzsFsHlPhICOg9KFoO3wOS7HC7YWral7XdAVZZ6YA9ZXZogBGQN9YYqX%2FZLaIX4M%2FmS1nt5RXmc9rY%2F%2B78wJGuPwoKH456%2FKfMLLLsTIL%2B1s4Btr%2BWc0%2FCT6nLAWiwg1Uv5zEjSAxPIfewHkTfgwU6gHiRcDb8fBuWAXRwr%2B%2F1KyXAfOxBPLfhDK%2BTrCILLlmEAEVXBtD5oDBv7jXGdJnDlhOsLInI7duy56M3G4b3pOhADo%2FgVMO2CAJDSegUtXVOiwlJix7c4MqYNJu0AZgMwJ0c3SJADYdzj6GvDA%2BgDWHBuz%2BBJGxpYYdg1BhIeQKYARDiksN4wJMVR8YmERJOH9JKiwyUlFFHkF3zg5roDEjOKgHGuOpx2aHmSrFVnLOVk0JYoxJVn1S5xwxRe%2BYKNh2ecgpVWV5dHGimlFpEZ9puNHKyyV0VZuA8nrr%2Fg6huuH3bnEXroWjih5J6FdS2odxo%2F0JTf28IGNIoF3MZZu0JNrgUKk9kpkPyGePnHRwZ4P81hgCgnCpAAGh0yevTiV5lrEAd%2FbC9aukpvwwCGWeY%2Fuz7IeNt1zi9cE1V7PSlIhw2aYCb659RCEFLFLmSOhe7PKDdC1raobi47ZDauuSazPC1SqGa1on%2F5FblUoHddHyLM4FWlyVaHujC4bSr2VFq0sOiPyBFexJZzUcoV2owqKJFEY0UfngCaIThxEyHW9jBOng%2FjR10iFvx4BUFwdSOuH9AbsiZhs3KjmKJyRMB3ejqZOuB3YMToUlvyvaGXqEWIUDc0QKoLHRVSkQQS9xBRmUA5Uox0kvceHVCqOMfeoZj7EehJQgHAqMszqL0kQT1OcHd5iT0mPnJB6ZWxDBkAj40qbnUxSuINzKh49v6Hup7nEpTXmMSNXYsRs9IvVSLE9x1SkVjbY8x5%2BTfAqedVMXbaRqZ2ikshUtcUYqoyrb%2BNOSOeF5aGOW3KRPWnNPmuVD68G1Np0OZnpx07fwVmk0MD6c%2B1GKcHqnD%2FXwNSuq4NbKh0KjWAR63qHTv%2FoavYWbxS4eaH0sWWrDCFDg04vDJ8h0mvnjfFhhaLVQJgcSB1JvZ7fzvGve8%2Fzh8e529Im2skZSyQ9m2mpcpIpJH1qKyLTVWhOqMdPWHDbRFsj7j9T3hZV3V8SIXVRWxExGtWsgZxAUoIiZtEgcTVLX1DORuyV0jWYZ%2FiQjn9NqMs4Cl6XC8WiRt6l2I6PykZebUnqAUCVFO2yZ0TdFKrASa%2BNtFDrf3WSsubW9t8UbY4Znny93HpL%2FTxLsJSXBHm2sUEmwijx0EuyBysT9JsEyrRVWhosp7hjEon0K7Nh3e%2Bny75VwigVMn89ZA7skp13KL6d5BYIEB5wTgBgRz4AK7C15LcmNUp7J5taW5shoaIt2ILNUsDSsAgnA1AO0LAZL2tkY4S8bQ%2BNfZM%2B0vvDPPcNqNPinc23%2FtpnZ4CMW8Yo2LMaBcrriwA2gZcUBSIzzZiAJywvMn4eZwp2e6UANPk29i6YAMQAGhpiknJ0YzVFxdmIUSIyy76guTERkKOr9GBUH0BDrEMKTErIq2zzrkQMm3XesgQO4FzQaDQfs6ec84oi54zmDPupXNGVgzjgPE7OFBiOsTFKuPE0sYo4HngEYGs%2B0ETKJOCEexFblgYlNosLOX3gIqwwElNOrK%2FZDIBLxUiGQoggjEHmeStym75abz7VQi7uEUx7Nu5pS2%2FUlg3lcITEYV9a4eB3215tqLjZXsOfX0i%2BHWLWXIw4gmwwkigvIyp%2BnVsHoxdtsfQgMdiGhXfNvr5HX%2FOPNzl5G2eTaSoqu3nM0P6h6m1BD5j7GJdRQ2b%2BPtT%2B8k3kh2xoZsmmtCmEQRdh4Dm5tzoLofBeFW5cWtpPHpyoNDdCp1QZlgZroCNXjEIGaFa04PNlxtZobURewoy3xtsWvuwWCfm8dbk%2BKgqgmaTQcZTCTNPikDTByNOi0gfnD5%2BfZw%2Bz%2FSJOu2ef7Gc4bOFSTbkx5BIpMqHg4j8DgobCRPqRdTS1R%2BhuxYsoCAbD0N3FFWPPnEZyrQbioU64GBc7%2BEjUYNZZPi8V7dTdQBbCTXZQHZoZooCRkxxY%2B%2BAxBSBmatAdpmrGRN57jFyEqP%2FAhq%2FiYxlEM8SPya0mpcAOo7QY28jGKf8VxkovROGOL6nQOwmpnRrg31%2Fecs8PasCISqi5pcB%2F6z3kEjYsj4DS7LPZHnDPMohyUfvfprrDEMk%2F8i%2F4Z4r%2FE%2B1L9xL%2FnZMg4C5y3IvEppeAY3nAUQxzNRZSPLf6F%2FgyNZoeyUbpm3909%2FgyNZb1fIzux84KUcO03nnMJukl%2FFL3dRe7vCVkLFzrU457qxl6c20n2EjleUYcV%2BPmK9GTyHHuJvcqD%2FtlqzTehRLqx%2FTRDQDwS%2FgyJ0j5vwmDl2QvvDxQmuXzzeOvG5%2Bf%2BuYShadbhOPogmq7DQdJLDhXhyEOnugVJcErzkq4t07oqR06h9kd9xE6hm5SW8bjwCVaQoLj%2BfKBzBw7BMWssGrOKyQNxHaKAMfEC5%2B1pLC7h3Jh41Yn2NBaXEmdMvEtXexoLq7gETOlSaCwuZNAU2bd9UBoL6%2BwFTE6hr6OnscZdHuOpaT%2F64oKsjXFx53rCf553lqf7V1rct5ggabUVTp%2Fh5IoA5v5a4OcDAf4NBwVBAOicIZDH6BdRxjfItzqTfacU05YGrK5wwRRc7ncbhVsvrBb%2BLfzBUryD5vUKx3VfpVkexWVV%2Fy3v%2FI6jret6FhK0Sa%2BHTEIiiaeVOO8aVVCV4u0xb3t0V%2FR6lgtJjDiU4aIqPGjASHGZxytUzAEhMC1AVaCLL2SKBWjf7kJl%2BF%2F6yv8BjLYhJeK0OCIRTi8DDEkuujHcIXKNAVrD0IYumVIKhqyUfotyxhsZmMgWOBDFGMlLFMVqBBsDnMhmZrWU43yIRacsUWJ8ZGhSSA72IATSaFHeXIQOHUr0LaFOSYvL25vm9WvVtgoTHyIyOn%2B2IuLIFE%2BKkKWKfoMQktEGsSTbtiiKqrxVlreG8REPgIGJRxtOU6imdzyhddMQyu76GTopCGGqTooMUQJ8gTptf02hlF53MA8tcrWuh2BCgCnusEVnKEwT6NTbHZhDb2dTb%2FHdHsziTmd1WnGdRBHN7mhW5YHR3PUcXAgyhcW%2FyCpdHJ1VYigtLoQ%2Fvz7PHl7uv7x8SS97IONPj6%2Fzh5svM4r%2B46ozZJBzlYN1hkyJAyBpW0FEBRzQmky%2FauDNyMbwvPVX%2F4YiGSMnNQiXIU000YXwOtM5r6p9iNBc6otxihkaogRWDBnmu3uTNuu8Xbore%2Bcn%2B1eh0r2NIXVFyVza4nrBjhYn2dm%2B9xu3LNXxwy58OyYb%2FWoXlOsi4dPVoJEvUB24B1wELi20B6FeDCsSin6XWb3lO2sMR3MAkA9zgNKXukDuOwXdtyMHMLoXCjPuaNPuFWH9Kq8%2FFG49d2kvcbwB%2BgM4LsFKUIHIOIP0xnXSaIUgHbwhsx1UAAWHJ3iQZN5i5y3zSWk2PoNtXN%2FF6ji9pUAYJ9VFry5EVip05fl%2BbYhKCUBMAR%2FWn2U%2FbLzlEiOKxWdVTuS%2BwWumVWE7WZUptgOsctk8qmUTlr8AtlNpthNmhtJGaIXt8HEdYaVNSPgBM469Dd%2FRl3pV4ktlF4U0MBiEXfZ3tDtzdhFmGxOlUQjZ5UHJzmiHxZ3seOqxcZOWVNUO5cxV0hQ2Wb9eAWptybtFTdJRNFURWoRJprpIGOC%2BtHRJUzeLjsD6fZykqgwUd7nEXXpBOrhJBy9UzpL8rEHk7ITy7fjLWWH5YcQ0uQA5qw9Adi5ytiY3D15PWqLykrN07F2TnP1352J1demtUOcMbMvB%2F%2FhYeEJZluRHKGkkECTimg6muhBxmkcUDyJOJxS%2BwV%2BcCkvvUkSe5w4rTo0ByM5FnNbE4%2BHrsxYXvMQpHZ1bEaeRazuOB%2BVZrrjmvoDU15Y7A3Iv2179NfXXyb%2B8TaHOstTjcrhmw01ug%2FQmlymvVSJDB5HXEwoE4S%2BvhaU8k%2FSrJuaELxdGGzvnT98L3PTEOPXMoQr08H3jJu6sG5IncWfDTS6cO80hfeYTKqLBnzsJkwhQpximiAvfC8OfMGndLW5n3OJ7sccI7WjbG7UaA8Idz5ZaS%2BfQGMEHxClSaZnKIzJGbNzhtQTpVQX1oV6T%2BFub2lLtHKxjUVWVIz2stetJRTJeqmrnOOmOsADWgLBg%2BINGCouDDqGeYQHoqJmPbhSEO9%2F3aAF7TBQLf7GqgSpHSbSaILPUBFJ%2FrpNUVfiwTzWmS2rLPp2b97Jit1hdDcUlJjCCV5AS%2FOYG38ORI1Ex6NjX3pAIOJ2mTCG6kIVQYWEeQss7HekA%2FLbbbMmD2ZFDRtIoW%2BUYBWsIk%2F6knVQGoKZhAXnvVkpNULM%2BqtxULHovZVb%2Bwf6%2FqidwjzNigHSU48Or5Xr8AGMvzo1L3tGl%2BoSiSztIOk3YXswoqtBcwqoW0VZHcu5HmwyUWa3I%2B4Jy57SqiUBZ3KY9oSAIfps2w%2F7l7%2Bnjs2srWYXd1ru2xtsxQofvtti1q7G8N%2Fu38Mp5ApGDqfTMM%2FnxRT2Up%2BguEBVShGiQvX3idWrbCkRh0bc67Xe%2FiTzU3I1AfZpOdxnUiygN6nU3zg%2B3LNNPFxZ%2BY4jcyHsiMCs8XByBRbo3eiIwQw8SR2CdjhZC%2BaJ%2Fh0gbuPfi2GUkAqW9GN3Ysdm%2FPdvBd6hodNMbehDGpMZUJoxZee4sBymPPHed0wHoiFz1OkOFIHASICnoyBrcmvnlfs4G6Uu4dKOFG63ZP38Ow%2BXG7lhAsH8Mt%2FbycwHx5Xj5WeA2hMWlGLQTd94xp0iADaeRI%2FBm%2BdubCTf1tkRtISrMPWvQ7tm7Ii0jLX%2BzQgZdlOET9w7winKuOAjyh%2BuHThaG6GRxVygkcIzwJV0dhsFvUzXclgHW05AIcnb4NQxJz8%2FNzRQJwrw6FieZK42HwAYjC8Xgfo5wmhNbteouUqW8WocnAJlv1xmDTqC%2Bbe%2BPLioljlJUKbIynKiaejO6tqJKWFqyLJ3iaDp8NtZZmi0hC4Y%2Fr%2FKcCTjyyfP942htctcKWwez1KzOdLWzacXyHC%2FraoXEVP1AmA01QeEr60zaQuusn%2B3PuxmBDFTBgAE25vmpawwR2BOrHs1gklnTDapJqocn1DiyO4PR9iWjUqjjOX7Rru4H5LYx8o3GKnvYF99Y56c7sPhmJEp4Z77RAN%2BNyRIpNo%2BMNWq7%2FIwTtLHITYOwLFl%2F09y%2F%2FvUJvOVmHgR7npptP5XLRqTZHgTQAc22xavwVoWbOzO2Pqyo5a2PbwvPW7wMsoWfXxwPq5rLSKoQ1pIbD5ZzqV8PDvBfPZTx%2BAkm3xQRa0LhyG3hxSrSNA58UTu%2BdWD5D6gUHDQEIg4boy%2BlyFt7S%2Fc3hZNSu4%2BDoRBBYntBm6TpI8SyUdOeWUfKitKPVJYleqPL%2FdtFBVDs4o6yfY4VyIpd3pUtr03JuvbFUyI39n5nDcIR5TOAwvtqH1FbAHivXRLGRbOLtvVbGEsoHb2EahXcZLHK4SzMhuQ8FlA5xTY6STUe087L2HrzdRPgeZf3xn5XtMXRix9mmhZT%2FnCIxsr54qLgazJ29hxDAuBLVrdh8yzbNaOHLzOipbftEwzmmBg7fAmJRcCXkR5ewPeHt4jwYT3qQDRy8AJrUPAqFwheg5EbkiNobGZVLZqlheeVsx9MZvRgqdtVzBOqsXEW87iqP846xRsxdc4ymZwlrlMo6RZIhTNcHQpmuKqELVBLORVD9iS2UaraFHHbHWpuB7jYsrQTp3nFamrpxa4YCQHOtwxGPEt%2FK0ZHNPzdGP6O%2BuRt3KV3UetjStX1UcmmU%2FYO6b2tDx2%2Byog4eQsje3%2FAyQUtkAaGXCBVzMl2o54AyLd6gdCeEzFlwDAqxTn0GNU7Z%2FAdEi%2FfitIQrSzAO21hGy4SN%2FDSz6VKJBoWhKnOnHPZ0otdzIhy5iFEDOJkk9E7pWVRIncL%2FwQkXRFuvk5lqrzKeovC37euA1%2BfVE%2FBdaB28c7OvY92%2FkBpRxkHPzN5lI37DfJ%2FhG%2BFnhKR0kYFWPCOu6MeNmsBjrjBTu8dbhNvA3k8wlVd0CYd4Knp4%2F27Q1Dy3KKiC3xk1Bo1fyX0vtAMWHrVng5JZC%2FsbwyXU9Y029ktWtgXi%2FSg%2FW6RD9jO9zU%2Bfn%2FcJehkIxtf2tH3R3gbL8HYvZa06qCCR7kdx2t6%2FdiHlcpN5EO1zzsPwTOY4%2FWk1Bf5WpLq9a4l%2FYCscTtUNpYBy3wRV7ZVZtRtfS5Jg%2BxwjikSFt4SkiCIsdOLVfwgxNxVv6pJsNVgUlpiFuuV7XlcnsZ1dlEMSfPsZnu8hK%2FyfXsbe4VawGc316nDVEYDKZbdz4WpAO0toVWpyLODdT3%2BgN0dIoGYCpEy9QGqKWwa5TBpTaP8VYmNx%2FCM9KXukDq9A0id66NcIwyNp7Xg6KcAOu3sM0EDtnnH7%2BVhJuQPHQrHo56MtxsS0Aese9SCyH%2F%2FGMFdHonx46pnrXxv%2B5%2Fss28vXP8JGiYZD0YpL%2BSGzl3t99zgIaaR767K19OGUcHfFgIcEY8Yq3zEIVyJa9OorM0HWTbysRLPq6wKXqqqXPOoupHHu58cn8XRd0mgU2ZiUqSp%2F47CFPeoWk0eW3VRy4mvFYk6Ldgfl0tNUAywPxVABV0nWJwbICsnBciMyNPORCsQh1artmBmvcpfX2jVpAtA60nxMGNHK6ve4TBo1ZQ6Wuvne72h9UDOw1mg1ehaEa5f5LHrFPaCvM54yZPozhsw41YD82ZeUwCMrF8CYM5Pe8tDTKYAMkW9AJB1Lk3TM2CGU6C6AwYo5w8Yku12TlIJkGNwAVq6DOorptdzY%2FpS0xUp61h%2B3njlVPR2VHhl5AANhVe57gTRh3LZyRa4BLwKbbXcE15ZTQmGwatZh8Rg4lU2tQuAqz7xwswsuOqKOPEqSfUlNoZSB8CBttHngdfzM6oBiaYSgVeljtfh1FdSOees8Uq4%2F6zwKk4dkPMuEIOrrwqp13zeeJ14rSMmXgc7SmG4B%2BoFNobDq2acP15l0oeyFF11jyJKLXD7190j%2FOF2Dv8zw5kjpnz35eXLCxmc383v5w%2Bvj2jg6W72gD7UoF9KBY3hOiVZ4J6OA%2FfCyPuNAkZJzbwSF6zgeHYtOIDUFhFRGfGARvbqSrgjKfNf6TZUVzpPCXwC5n5TNktlEdRgiEVSohuWmZ%2BV8Q%2F4lyttT1Q6PePJjmx0ozBt04JTFPZW3W%2BKuj2i9RVhm%2FbxeKp6XW2myQjEy0Pzebe%2BIkW3jseiqI2IiUWG4gT410VrT1RaeM5jx%2FbpJDr0cDho9Kq3TDqaiPmiUyjFOTeB6yTZHa%2BysO9G9H6QrhWdNC8lm1H6reMOT2ZUb0rmh6tV7CbUohyplDGKb5PEiKX3o7JS%2Br%2B7MMHULH1aZ%2F%2FiGfHWDphTiuSiD06arThL5VGCUqZYt%2Fyysdc4OavoIIXbSq2gCEMjlWQORBX0f%2FgR5VuRx4Evnz5R9SnhMH41MlrfmLOAaQgX2%2FddP1xDEYpgVQqEr%2FxWipA%2FJDpX3i93%2BVLkdFIg5yJPTaMmToEKrln1qwhqKxkfyjUPocqr8uSo9nuGsg8sRZiMJU1%2B%2BNK4OQuWd8JrexrL4mg88TPC9jQWqLfS%2BWGv3jbPwy%2FL%2Fbre2rYbPBe5qlJ1iFhGE0NNlTUeNhPhgnL29cKDT99DJ4yjaaNJ8rVS3XXyfLmyFi%2FnexPv8kK5JC4XZXKjyO6jUwgP%2BuQ5AxX6mPlOzZtA6kn9AkYuyyyW3WMJKxqpSl33ZCH0EtadTZW6xowJoZclTh8Zqb2GGqszauj4WfkpF2Xg6%2FYGidZgEW%2FxTIkeOspwG%2B9rb3dpWY82b3wGFHh2V15gp8VMCAk20EC2L90SN0iC735DPA%2Bc42%2BIqye1v2QK2H6MaosRsChwA8%2Bfp1z631vsvhUiDbmaslun0g0N1PxRwvVNWQJV6LG0ccAyVvioml3dP32jjpHRJHRbpys5zLZRiDpGlDtOTBmAgFVzpjcAymPXKxl5Baok7LxGlc%2FQz8WmsTBbJ3%2BeckAB0pKWU99bNIYjrMe9hdGFDglHB3t6pCBcpvX2MFFXqJIdpVi2LsPNh15ULRPGXsx0HPIov6VKrL0lfA%2FpAmifUCu%2FvCziP4cu%2BEoRdiIFUQsItfff1Xyb9AKydHg%2BWxmnOPoRHaWprDQlVVaEbX8SrfWXZYrru5vMuB2zXMlPBA%2FJFYuLXGmIj%2FsIlju%2FcIWEXhyHAS1LGNfCZY2hcEjLZNevn8dbN0ZFz%2Bkf0hak5C4r%2BDiB4022XHMBxtZIqMdCFmcNByOoeCBB6epjGJ%2FymAujqoTibiHiqcd3RJGrC64dajRan0B2Jl7Bsjm5KnVZG4ulihaU7HDXvthDphs41GXW30hCSvdQVLIK0za2e5iogMvB0r46a0390mnppjGWj0cvSVXpJcxGrP5FBFlFuhGlVoT7gdYl0MECCRltcY4yoSH2kU%2FB7g2HSisUyt3uUOnEP5pL7Ks0oLKosx%2FRInzAwxk%2Bm4BRz%2B9iWeEsHYmLFU7%2BWAnhL95m51f8u%2Fs9PQOWGO9OXVZ0S2%2FUlXmFQh6jgTLoRktaWeMeV9eg4ik1FY8KOuNWB7uuS2a1ZBuVz6Yn41apqmvmdquVVHTunuOW9DLldit5CukMWjeNPSY1B8%2FRyJe1e46GdC3Vj%2BI%2FZDpox8UityF3lWt34JKlofBK9ZZ4i7fBmMK0BuQJOtA2oPvtiOEJggQueUtaHh2Sw5cLU9TXhk%2BqkiGgvFwrJgAk4bb%2FncGCkqz0v%2BrqobYn16D0v3aNME5x9yic0nu4r4VKsNd%2F35FaEW2g1jVZXgqXUXfza1nZgWZ3X30GeTZ%2B%2Fj7anOnL39cg8PZ4%2B6w6vQDtL2K6%2B%2Fic19Hbx7NrV%2Fu6Ld1469u%2F7bwBXN0cJyew%2BOrpHrTKTdtV80FrTaS1jpfk4uuTuZVu7%2By3Y8g2iZG41YPAa6AW%2FBqFKPa3kBmQfd%2FuwyXSgeb%2FDw%3D%3D'
    return img29, img30, img31, img32, img33, img34, img35, img36, img37, gif2, gif3, gif5, url1
img29, img30, img31, img32, img33, img34, img35, img36, img37, gif2, gif3, gif5, url1 = load_resources('load')

titulo(2, '5. Resultados').create()
titulo(3, '5.1 Algoritmos').create()

st.markdown(f'<iframe src={url1} height="1770" width="100%" style="border:0px solid black"></iframe>', unsafe_allow_html = True)

titulo(3, '5.2 Módulos').create()
tab1, tab2, tab3, tab4, tab5, tab6, tab7, tab8, tab9 = st.tabs(['Módulo de correas planas', 'Módulo de correas trapezoidales', 'Módulo de cadenas', 'Módulo de engranajes', 'Módulo de parametros del eje', 'Módulo de factores de concentración de esfuerzos', 'Módulo de resultados del eje', 'Módulo de simulación del eje', 'Módulo de elementos bidimensionales'])
with tab1:
    st.image(img29, use_column_width = True)
with tab2:
    st.image(img30, use_column_width = True)
with tab3:
    st.image(img31, use_column_width = True)
with tab4:
    st.image(img32, use_column_width = True)
with tab5:
    st.image(img33, use_column_width = True)
with tab6:
    st.image(img34, use_column_width = True)
with tab7:
    st.image(img35, use_column_width = True)
with tab8:
    st.image(img36, use_column_width = True)
with tab9:
    st.image(img37, use_column_width = True)
st.markdown('#####')
text = '''
    La aplicación desarrollada ofrece una gran variedad de resultados, tanto numéricos como gráficos,
    a partir de los cuales el diseñador puede basarse para efectuar las optimizaciones correspondientes.
    No obstante, muchas veces resulta necesario una visualización mucho mas intuitiva de ciertos resultados, 
    por lo que, adicionalmente la aplicación permite crear representaciones visuales mucho mas didacticas como las siguientes:
'''
texto(text).create()
st.markdown('#####')
col1, col2, col3 = st.columns([1, 1, 1], gap = 'small', vertical_alignment = 'center')
with col1:
     st.markdown(f'<img src = "data:image/gif;base64,{gif5}" width = "100%" style="border-radius: 30px;">', unsafe_allow_html = True)
with col2:
     st.markdown(f'<img src = "data:image/gif;base64,{gif3}" width = "100%" style="border-radius: 30px;">', unsafe_allow_html = True)
with col3:
     st.markdown(f'<img src = "data:image/gif;base64,{gif2}" width = "100%" style="border-radius: 30px;">', unsafe_allow_html = True)
st.markdown('#####')

titulo(3, '5.3 Documentación').create()
text = '''
    Todos los modulos desarrollados pueden ser utilizados directamente desde cualquier
    navegador web, como google chrome, microsoft edge, etc. Esto se debe a que el proyecto
    se integro con GitHub, la cual es una de las herramientas mas utilizadas
    por programadores para el desarrollo y distribución de software. Todo el proyecto se encuentra
    registrado en un repositorio publico, en el cual se explica de manera resumida la aplicación desarrollada, 
    y se brinda los accesos directos a las aplicaciones junto con sus respectivos tutoriales. Ademas, gracias a 
    la señalada integración, se puede ejecutar actualizaciones de la aplicación de manera global, en caso fuese necesario una.
'''
texto(text).create()
st.markdown('#####')
url2 = 'https://junior19a2000.github.io/Bachillerato/'
st.markdown(f'<iframe src={url2} height="450" width="100%" style="border-radius: 50px;"></iframe>', unsafe_allow_html = True)