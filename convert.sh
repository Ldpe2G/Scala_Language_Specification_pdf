PROJECT_ROOT=$(cd "$(dirname $0)"; pwd)

SCALA_PRODECT_DIR=${PROJECT_ROOT}/scala/spec

# generate pdf files
PDF_RESULT_DIR=pdf

if [ ! -d $PDF_RESULT_DIR ] ; then
  mkdir -p $PDF_RESULT_DIR
fi

ls ${SCALA_PRODECT_DIR} \
	| grep ".md" \
	| grep '^[0-9]\|index' \
	| awk -F ".md" -v scala_path="$SCALA_PRODECT_DIR" -v result_path="$PDF_RESULT_DIR" '{print " pandoc " scala_path "/"  $0 " -s -o " result_path "/" $1 ".pdf --pdf-engine=xelatex --standalone"}' \
	| sh

# generate epub files
EPUB_RESULT_DIR=epub	

if [ ! -d $EPUB_RESULT_DIR ] ; then
  mkdir -p $EPUB_RESULT_DIR
fi

ls ${SCALA_PRODECT_DIR} \
	| grep ".md" \
	| grep '^[0-9]\|index' \
	| awk -F ".md" -v scala_path="$SCALA_PRODECT_DIR" -v result_path="$EPUB_RESULT_DIR" '{print " pandoc " scala_path "/"  $0 " -s -o " result_path "/" $1 ".epub "}' \
	| sh

# merge all md files and generage one epub file
rm merge.md
ls ${SCALA_PRODECT_DIR} \
	| grep ".md" \
	| grep 'index' \
	| awk -F ".md" -v scala_path="$SCALA_PRODECT_DIR" '{print " cat " scala_path "/"  $0  " >> merge.md"}' \
	| sh
ls ${SCALA_PRODECT_DIR} \
	| grep ".md" \
	| grep '^[0-9]' \
	| awk -F ".md" -v scala_path="$SCALA_PRODECT_DIR" '{print " cat " scala_path "/"  $0  " >> merge.md"}' \
	| sh
pandoc  merge.md -s -o $EPUB_RESULT_DIR/merge.epub
