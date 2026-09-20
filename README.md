<div align="center">

# Office Manager

### Microsoft Office deployment and management from one interactive Windows script

**أداة تفاعلية لتثبيت Microsoft Office وإدارته من خلال سكربت واحد على Windows**

[![Version](https://img.shields.io/badge/version-1.0-2563EB?style=flat-square)](https://github.com/e-yharpah/Office_Manger_tools)
[![Platform](https://img.shields.io/badge/platform-Windows-0078D4?style=flat-square&logo=windows)](https://www.microsoft.com/windows)
[![Language](https://img.shields.io/badge/language-Batch-4D4D4D?style=flat-square&logo=windows-terminal)](Office_Manager.bat)
[![License](https://img.shields.io/badge/license-Free%20Use%20%7C%20No%20Redistribution-orange?style=flat-square)](License.txt)

[العربية](#العربية) • [English](#english)

</div>

---

## العربية

**Office Manager V1.0** هو سكربت Batch تفاعلي لإدارة Microsoft Office باستخدام أداة Microsoft الرسمية **Office Deployment Tool (ODT)**. يجمع التثبيت والتحويل وإدارة اللغات والترخيص والإزالة في واجهة نصية واحدة سهلة الاستخدام.

> [!IMPORTANT]
> هذه الأداة لا توفر مفاتيح تفعيل ولا تتجاوز ترخيص Microsoft. استخدم مفتاحًا أصليًا وترخيصًا صالحًا فقط.

### المزايا

- تثبيت Office 2019 و2021 و2024.
- دعم إصدارات Retail وVolume/LTSC المتاحة في القوائم.
- تثبيت Project وVisio بإصدارات 2019 و2021 و2024.
- الاختيار بين بنية 32-bit و64-bit.
- دعم العربية والإنجليزية والتركية ولغة نظام Windows.
- تثبيت الحزمة الكاملة أو تطبيقات Office محددة.
- تحويل إصدار Office أو قناة التحديث باستخدام ODT.
- عرض معلومات Office المثبت: المنتج، البنية، القناة والإصدار.
- عرض حالة الترخيص وإدخال مفتاح أصلي والتفعيل عبر `OSPP.VBS`.
- تثبيت حزم اللغات وإزالة منتجات Click-to-Run.
- تنزيل أحدث نسخة من ODT تلقائيًا عند الحاجة.

### المتطلبات

| المتطلب | التفاصيل |
|---|---|
| نظام التشغيل | Windows 10 أو Windows 11 |
| الصلاحيات | تشغيل كمسؤول (Administrator) |
| الإنترنت | مطلوب لتنزيل ODT وملفات Office |
| نوع Office | إصدارات Click-to-Run المدعومة بواسطة ODT |

### التنزيل والتشغيل

1. افتح ملف [`Office_Manager.bat`](Office_Manager.bat).
2. اضغط **Download raw file** أو **Raw** ثم احفظ الملف بالامتداد `.bat`.
3. انقر بزر الفأرة الأيمن على الملف واختر **Run as administrator**.
4. إذا لم يجد البرنامج `setup.exe`، اختر تنزيل Office Deployment Tool تلقائيًا.
5. اختر العملية المطلوبة واتبع التعليمات الظاهرة.

> [!TIP]
> أغلق Word وExcel وOutlook وبقية تطبيقات Office قبل التثبيت أو التحويل أو الإزالة.

### الوظائف الرئيسية

| القائمة | الوظيفة |
|---|---|
| Install | تثبيت Office أو Project أو Visio |
| Convert / Migrate | إزالة النسخة الحالية وتثبيت الإصدار المستهدف |
| Activation & Product Key | عرض الترخيص وإدخال مفتاح أصلي وتنفيذ التفعيل |
| Language Packs | إضافة العربية أو الإنجليزية أو التركية |
| Office Information | عرض معلومات النسخة المثبتة |
| Uninstall | إزالة منتجات Office Click-to-Run عبر ODT |
| Update ODT | تنزيل أحدث `setup.exe` من Microsoft |

### ملاحظات مهمة

- التحويل يستخدم خيار **Remove All** في ODT ثم يثبت الإصدار المحدد.
- الأداة لا تحذف ملفات Outlook من نوع PST أو OST يدويًا.
- الإزالة الحالية ليست تنظيفًا قسريًا للسجل؛ بل تستخدم طريقة ODT الرسمية.
- خذ نسخة احتياطية من ملفاتك وإعدادات Outlook المهمة قبل التحويل أو الإزالة.
- راجع الملخص الذي يعرضه البرنامج قبل بدء أي عملية.

### الدعم والمساهمة

وجدت مشكلة؟ افتح [بلاغًا جديدًا](https://github.com/e-yharpah/Office_Manger_tools/issues/new/choose) وأرفق إصدار Windows وإصدار Office ورسالة الخطأ بعد إخفاء أي مفتاح منتج أو بيانات شخصية. للمساهمة، راجع [دليل المساهمة](CONTRIBUTING.md).

---

## English

**Office Manager V1.0** is an interactive Batch utility for managing Microsoft Office through Microsoft's official **Office Deployment Tool (ODT)**. It combines deployment, migration, language management, licensing operations, and removal in one menu-driven script.

> [!IMPORTANT]
> This tool does not provide activation keys or bypass Microsoft licensing. Use only genuine product keys and valid licenses.

### Features

- Install Office 2019, 2021, and 2024.
- Support the Retail and Volume/LTSC editions exposed by the menus.
- Install Project and Visio 2019, 2021, and 2024.
- Select 32-bit or 64-bit architecture.
- Install English, Arabic, Turkish, or the Windows display language.
- Install a full suite or choose individual Office applications.
- Convert an Office edition or channel through ODT.
- Display installed product, architecture, channel, and version information.
- View license status, enter a genuine key, and activate through `OSPP.VBS`.
- Add language packs and remove Click-to-Run products.
- Download the latest ODT executable automatically when required.

### Requirements

| Requirement | Details |
|---|---|
| Operating system | Windows 10 or Windows 11 |
| Permissions | Run as Administrator |
| Internet | Required to download ODT and Office files |
| Office type | Click-to-Run editions supported by ODT |

### Download and run

1. Open [`Office_Manager.bat`](Office_Manager.bat).
2. Select **Download raw file** or **Raw**, then save it with the `.bat` extension.
3. Right-click the file and select **Run as administrator**.
4. If `setup.exe` is missing, choose the automatic ODT download option.
5. Select the required operation and follow the prompts.

> [!TIP]
> Close Word, Excel, Outlook, and all other Office applications before installing, migrating, or removing Office.

### Main menu

| Menu | Purpose |
|---|---|
| Install | Install Office, Project, or Visio |
| Convert / Migrate | Remove the current edition and install the selected target |
| Activation & Product Key | View licensing, enter a genuine key, and activate |
| Language Packs | Add Arabic, English, or Turkish |
| Office Information | Display information about the installed edition |
| Uninstall | Remove Click-to-Run Office products through ODT |
| Update ODT | Download the latest Microsoft `setup.exe` |

### Important notes

- Migration uses ODT's **Remove All** option before installing the selected edition.
- The tool does not manually delete Outlook PST or OST files.
- The current removal method uses official ODT configuration and does not perform aggressive registry cleanup.
- Back up important files and Outlook settings before migration or removal.
- Review the summary displayed by the script before confirming an operation.

### Support and contributing

Found a problem? [Open an issue](https://github.com/e-yharpah/Office_Manger_tools/issues/new/choose) and include your Windows version, Office edition, and the exact error after removing product keys and personal information. See [CONTRIBUTING.md](CONTRIBUTING.md) before submitting a contribution.

---

## Keywords | الكلمات المفتاحية

**English:** Microsoft Office Manager, Office Deployment Tool, ODT, Office installer, Office 2019, Office 2021, Office 2024, Office LTSC, Project installer, Visio installer, Office activation manager, Office product key manager, Office language pack, Office migration, Office channel conversion, Office uninstall tool, Windows Batch script, Office Click-to-Run.

**العربية:** مدير أوفيس، تثبيت Microsoft Office، أداة تثبيت أوفيس، إدارة أوفيس، Office Deployment Tool، تثبيت أوفيس 2019، تثبيت أوفيس 2021، تثبيت أوفيس 2024، أوفيس LTSC، تثبيت Project، تثبيت Visio، إدارة تفعيل أوفيس، مفتاح منتج أوفيس، حزم لغات أوفيس، تحويل إصدار أوفيس، تغيير قناة أوفيس، إزالة أوفيس، سكربت Batch لويندوز.

---

## License

Free to use under the [Office Manager Free Use License](License.txt). Redistribution, resale, and commercial or material gain require prior written permission.

**Design & Development: E. Yasser Ali**
